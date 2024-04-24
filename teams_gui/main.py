import urllib.parse
import sqlalchemy as db
import sys
import os
from dotenv import load_dotenv
from PyQt6.QtCore import Qt
from PyQt6.QtWidgets import QApplication, QMainWindow, QPushButton, QLabel, QComboBox, QVBoxLayout, QWidget, \
    QHBoxLayout, QLineEdit, QTableWidget, QTableWidgetItem, QHeaderView, QAbstractItemView, QMessageBox


def connect_to_database():
    try:
        # Load environment variables from .env file
        load_dotenv()

        # Retrieve secrets from environment variables
        db_username = os.getenv("DB_USERNAME")
        db_password = os.getenv("DB_PASSWORD")
        db_name = os.getenv("DB_NAME")
        db_host = os.getenv("DB_HOST")
        db_port = os.getenv("DB_PORT")

        # Use the secrets
        password_encoded = urllib.parse.quote_plus(db_password)
        connection_string = f"mssql+pymssql://{db_username}:{password_encoded}@{db_host}:{db_port}/{db_name}"
        engine = db.create_engine(connection_string)
        connection = engine.connect()
        print(f"DB connection successfully")
        return connection, engine
    except Exception as e:
        print(f"Error connecting to database: {e}")
        return None


def fetch_table_names(connection):
    try:
        metadata = db.MetaData()
        metadata.reflect(bind=connection)
        table_names = list(metadata.tables.keys())
        return ["Select Table"] + table_names
    except Exception as e:
        print(f"Error fetching table names: {e}")
        return []


def get_table_headers(engine, table_name='teams'):
    try:
        metadata = db.MetaData()
        census = db.Table(table_name, metadata, autoload_with=engine)
        headers = census.columns.keys()
        return headers
    except Exception as e:
        print(f"Error fetching table: {e}")
        return None


# def decrypt_org_email(session, all_res):
#     decrypted_emails = []
#
#     for org_id, org_name, encrypted_email in all_res:
#         # Call the database procedure to decrypt the email
#         result = session.execute("EXEC DecryptOrganizationEmailByID :org_id", {"org_id": org_id})
#
#         # Fetch the decrypted email from the result set
#         decrypted_email = result.fetchone()[0] if result.rowcount > 0 else None
#
#         # Append the tuple with org_id, org_name, and decrypted_email to the result list
#         decrypted_emails.append((org_id, org_name, decrypted_email))
#
#     return decrypted_emails

def decrypt_org_email(connection, all_res):
    decrypted_emails = []

    for org_id, org_name, encrypted_email in all_res:
        # Create an output parameter for the decrypted email
        decrypted_email_param = db.outparam("decryptedEmail")
        output = ""

        # Call the database procedure to decrypt the email
        result = connection.execute(db.text(f"EXEC DecryptOrganizationEmailByID {org_id}"))
        # print(output)
        # print(result)

        row = result.fetchone()
        if row is not None:
            decrypted_email = row[0]
        else:
            decrypted_email = 'No Email'

        # Append the tuple with org_id, org_name, and decrypted_email to the result list
        decrypted_emails.append((org_id, org_name, decrypted_email))

    return decrypted_emails


def decrypt_user_email(connection, all_res):
    decrypted_emails = []
    for user_id, first_name, last_name, user_email, org_id in all_res:
        result = connection.execute(db.text(f"EXEC DecryptUserEmailByID {user_id}"))
        row = result.fetchone()
        if row is not None:
            decrypted_email = row[0]
        else:
            decrypted_email = 'No Email'
        decrypted_emails.append((user_id, first_name, last_name, decrypted_email, org_id))
    return decrypted_emails


def decrypt_messages(connection, all_res):
    decrypted_msgs = []
    print(all_res)
    for msg_id, usr_id, channel_id, msg_txt, creation_date, last_modified_date in all_res:
        result = connection.execute(db.text(f"EXEC DecryptMessageByID {msg_id}"))
        row = result.fetchone()
        if row is not None:
            decrypted_msg = row[0]
        else:
            decrypted_msg = ''
        decrypted_msgs.append((msg_id, usr_id, channel_id, decrypted_msg, creation_date, last_modified_date))
    return decrypted_msgs


def get_table_data(engine, table_name='teams'):
    try:
        metadata = db.MetaData()
        table = db.Table(table_name, metadata, autoload_with=engine)
        connection = engine.connect()
        query = db.select(table.columns)
        res_proxy = connection.execute(query)
        all_rows = res_proxy.fetchall()
        if table_name == 'Organization':
            all_rows = decrypt_org_email(connection, all_rows)
        if table_name == 'Users':
            all_rows = decrypt_user_email(connection, all_rows)
        # print(all_rows)l
        # print(table_name)
        if table_name == 'Messages':
            all_rows = decrypt_messages(connection, all_rows)
        return all_rows
    except Exception as e:
        print(f"Error fetching table: {e}")
        return None


def get_table_col_data_type(engine, table_name='Teams'):
    try:
        meta = db.MetaData()
        meta.reflect(bind=engine)
        tbl = db.Table(table_name, meta, autoload=True)
        all_col = tbl.c
        tbl_col = {}
        for col in all_col:
            tbl_col[col.name] = col.type
        return tbl_col
    except Exception as e:
        print(f"Error fetching table col with its data type: {e}")
        return None


class TableWindow(QMainWindow):
    def __init__(self, db_conn, engine, table_name):
        super().__init__()
        self.db_conn = db_conn
        self.engine = engine
        self.table_name = table_name
        self.headers = []
        self.data = []
        self.filtered_data = []

        self.setWindowTitle(f"Table: {table_name}")
        self.setGeometry(100, 100, 1100, 850)  # (x, y, width, height)

        self.layout = QVBoxLayout()

        # Fetch table data
        self.fetch_table_data()

        # Create filter widgets for each column
        self.filter_widgets = []
        self.create_filter_widgets()

        # Create table widget and populate with data
        self.table = QTableWidget()
        self.update_table()

        # Set selection mode to SingleSelection
        self.table.setSelectionMode(QAbstractItemView.SelectionMode.SingleSelection)

        # Layout
        self.layout.addWidget(self.table)

        # Set central widget
        central_widget = QWidget()
        central_widget.setLayout(self.layout)
        self.setCentralWidget(central_widget)

        # Create CRUD buttons
        create_button = QPushButton("Create")
        update_button = QPushButton("Update")
        delete_button = QPushButton("Delete")
        refresh_button = QPushButton("Refresh")

        # Connect CRUD buttons to methods
        create_button.clicked.connect(self.on_create_click)
        update_button.clicked.connect(self.on_update_click)
        delete_button.clicked.connect(self.on_delete_click)
        refresh_button.clicked.connect(self.refresh_table)

        # Layout for CRUD buttons
        buttons_layout = QHBoxLayout()
        buttons_layout.addWidget(create_button)
        buttons_layout.addWidget(update_button)
        buttons_layout.addWidget(delete_button)
        buttons_layout.addWidget(refresh_button)
        self.layout.addLayout(buttons_layout)  # Add buttons layout to main layout
        # self.table.itemClicked.connect(self.on_row_click)
        # Connect currentItemChanged signal to on_row_select method
        self.table.currentItemChanged.connect(self.on_row_select)

    def refresh_table(self):
        self.filtered_data = []
        self.fetch_table_data()
        self.update_table()
        # Clear filter widgets
        for widget in self.filter_widgets:
            widget.setText("")

    def on_row_select(self, current, previous):
        if current is not None:
            # Get the row index of the selected item
            row_index = current.row()

            # Get the data for the selected row
            row_data = self.filtered_data[row_index]

            # Update the filter text boxes with the data from the selected row
            for widget, value in zip(self.filter_widgets, row_data):
                widget.setText(str(value))

    def on_row_click(self, item):
        # Get the row index of the clicked item
        row_index = item.row()

        # Get the data for the clicked row
        row_data = self.filtered_data[row_index]

        # Update the filter text boxes with the data from the clicked row
        for index, value in enumerate(row_data):
            self.filter_widgets[index].setText(str(value))

    def fetch_table_data(self):
        try:
            self.headers = get_table_headers(self.engine, self.table_name)
            self.data = get_table_data(self.engine, self.table_name)
            self.filtered_data = self.data[:]
        except Exception as e:
            print(f"Error fetching table data: {e}")

    def create_filter_widgets(self):
        for index, header in enumerate(self.headers):
            label = QLabel(header)
            line_edit = QLineEdit()
            # line_edit.textChanged.connect(lambda text, index=index: self.filter_data(index, text))
            line_edit.textChanged.connect(lambda text, index=index: self.filter_data())
            hbox = QHBoxLayout()
            hbox.addWidget(label)
            hbox.addWidget(line_edit)
            self.layout.addLayout(hbox)
            self.filter_widgets.append(line_edit)

    def filter_data(self):
        # Get filter values from filter widgets
        filter_values = [widget.text().lower() for widget in self.filter_widgets]

        # Filter data based on filter values
        self.filtered_data = []
        for row in self.data:
            include_row = all(value in str(cell).lower() for value, cell in zip(filter_values, row))
            if include_row:
                self.filtered_data.append(row)

        # Update the table with filtered data
        self.update_table()

    def update_table(self):
        self.table.clear()
        self.table.setRowCount(len(self.filtered_data))
        self.table.setColumnCount(len(self.headers))
        self.table.setHorizontalHeaderLabels(self.headers)

        for row_index, row in enumerate(self.filtered_data):
            for col_index, value in enumerate(row):
                item = QTableWidgetItem(str(value))
                item.setFlags(item.flags() ^ Qt.ItemFlag.ItemIsEditable)  # Make the item non-editable
                self.table.setItem(row_index, col_index, item)

        # Set selection mode to select entire rows
        self.table.setSelectionMode(QAbstractItemView.SelectionMode.SingleSelection)
        self.table.setSelectionBehavior(QAbstractItemView.SelectionBehavior.SelectRows)

        # Resize columns to fit content
        self.table.horizontalHeader().setSectionResizeMode(QHeaderView.ResizeMode.ResizeToContents)

    def on_create_click(self):
        # Get data from filter text boxes
        filter_values = [widget.text() for widget in self.filter_widgets]

        try:
            # Insert data into the table
            self.insert_data(filter_values)
            QMessageBox.information(self, "Success", "Insertion successful")
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Insertion failed: {str(e)}")

    def insert_data(self, filter_values):
        try:
            # Fetch table headers
            headers = get_table_headers(self.engine, self.table_name)
            if not headers:
                print("Error fetching table headers")
                return

            # Get the column data types for the table
            column_types = get_table_col_data_type(self.engine, self.table_name)
            if not column_types:
                print("Error fetching table column data types")
                return

            # Create a connection to the engine
            with self.engine.connect() as conn:
                # Reflect the specific table
                meta = db.MetaData()
                meta.reflect(bind=self.engine)
                specific_table = db.Table(self.table_name, meta, autoload=True)

                # Insert data into the table
                try:
                    insert_values = {}
                    for header, value in zip(headers, filter_values):
                        column_type = column_types[header]

                        # Convert value based on column type
                        if isinstance(column_type, db.INTEGER):
                            insert_values[header] = int(value)
                        elif isinstance(column_type, db.FLOAT):
                            insert_values[header] = float(value)
                        elif isinstance(column_type, db.BOOLEAN):
                            insert_values[header] = bool(value)
                        elif isinstance(column_type, (db.VARCHAR, db.TEXT)):
                            insert_values[header] = str(value)
                        elif isinstance(column_type, db.DATE):
                            # Convert date string to date object if needed
                            insert_values[header] = value
                        else:
                            # Handle other types as needed
                            insert_values[header] = value

                    insert_query = db.insert(specific_table)
                    conn.execute(insert_query, insert_values)
                    conn.commit()

                    self.fetch_table_data()
                    self.update_table()

                    print("Insertion successful")
                except Exception as e:
                    print(f"Error inserting data: {e}")
                    raise
        except Exception as e:
            print(f"Error inserting data: {e}")
            raise

    def on_update_click(self):
        try:
            # Get data from filter text boxes
            primary_key = self.filter_widgets[0].text()
            filter_values = [widget.text() for widget in self.filter_widgets[1:]]
            self.update_data(primary_key, filter_values)
            QMessageBox.information(self, "Success", "Update successful")
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Update failed: {str(e)}")

    def update_data(self, primary_key_val, filter_values):
        try:
            # Get the column data types for the table
            column_types = get_table_col_data_type(self.engine, self.table_name)
            if not column_types:
                print("Error fetching table column data types")
                return

            # Extract primary key
            primary_key = next(iter(column_types))
            del column_types[primary_key]

            # Create a connection to the engine
            with self.engine.connect() as conn:
                # Reflect the specific table
                meta = db.MetaData()
                meta.reflect(bind=self.engine)
                specific_table = db.Table(self.table_name, meta, autoload=True)

                # Build update query
                update_values = {}
                for header, value in zip(column_types.keys(), filter_values):
                    column_type = column_types[header]

                    # Convert value based on column type
                    if isinstance(column_type, db.INTEGER):
                        update_values[header] = int(value)
                    elif isinstance(column_type, db.FLOAT):
                        update_values[header] = float(value)
                    elif isinstance(column_type, db.BOOLEAN):
                        update_values[header] = bool(value)
                    elif isinstance(column_type, (db.VARCHAR, db.TEXT)):
                        update_values[header] = str(value)
                    elif isinstance(column_type, db.DATE):
                        # Convert date string to date object if needed
                        update_values[header] = value
                    else:
                        # Handle other types as needed
                        update_values[header] = value

                update_query = db.update(specific_table).where(specific_table.c[primary_key] == primary_key_val).values(
                    update_values)
                conn.execute(update_query)
                conn.commit()

                self.fetch_table_data()
                self.update_table()

                print("Update successful")
        except Exception as e:
            print(f"Error updating data: {e}")
            raise

    def on_delete_click(self):
        try:
            # Get the selected row index
            selected_row = self.table.currentRow()
            if selected_row == -1:
                QMessageBox.warning(self, "Warning", "Please select a row to delete.")
                return

            # Get the primary key value of the selected row
            primary_key_val = self.filtered_data[selected_row][0]  # Assuming the primary key is the first column

            # Perform delete operation
            self.delete_data(primary_key_val)
            QMessageBox.information(self, "Success", "Delete successful")
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Delete failed: {str(e)}")

    def delete_data(self, primary_key_val):
        try:
            self.headers = get_table_headers(self.engine, self.table_name)
            primary_key = self.headers[0]
            # Create a connection to the engine
            with self.engine.connect() as conn:
                # Reflect the specific table
                meta = db.MetaData()
                meta.reflect(bind=self.engine)
                specific_table = db.Table(self.table_name, meta, autoload=True)

                # Build delete query
                delete_query = db.delete(specific_table).where(specific_table.c[primary_key] == primary_key_val)

                # Execute delete query
                conn.execute(delete_query)
                conn.commit()

                self.fetch_table_data()
                self.update_table()

                print("Delete successful")
        except Exception as e:
            print(f"Error deleting data: {e}")
            raise


class MainWindow(QMainWindow):
    def __init__(self, db_conn, engine):
        super().__init__()
        self.db_conn = db_conn
        self.engine = engine

        self.setWindowTitle("TEAMS BACKUP PLATFORM")
        self.setGeometry(100, 100, 600, 500)

        # Create a central widget and layout
        central_widget = QWidget()
        central_layout = QVBoxLayout()
        central_widget.setLayout(central_layout)
        self.setCentralWidget(central_widget)

        # Create label for Tables
        self.tables_label = QLabel("Tables:", self)
        self.tables_combobox = QComboBox(self)

        # Add label and combobox to the layout
        central_layout.addStretch(1)  # Add stretch to push the items to the center vertically
        central_layout.addWidget(self.tables_label, alignment=Qt.AlignmentFlag.AlignCenter)
        central_layout.addWidget(self.tables_combobox, alignment=Qt.AlignmentFlag.AlignCenter)
        central_layout.addStretch(1)

        # Fetch table names from the database
        if self.db_conn:
            table_names = fetch_table_names(self.db_conn)
            self.tables_combobox.addItems(table_names)

        self.tables_combobox.currentIndexChanged.connect(self.on_table_select)

        self.table_window = None

    def on_table_select(self, index):
        if index > 0:  # Skip "Select Table" option
            table_name = self.tables_combobox.currentText()
            self.table_window = TableWindow(self.db_conn, self.engine, table_name)
            self.table_window.show()


if __name__ == "__main__":
    db_conn, engine = connect_to_database()
    app = QApplication(sys.argv)
    window = MainWindow(db_conn, engine)
    window.show()
    sys.exit(app.exec())
