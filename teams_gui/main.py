import urllib.parse
import sqlalchemy as db
import sys
from PyQt6.QtWidgets import QApplication, QMainWindow, QPushButton, QLabel, QComboBox, QVBoxLayout, QWidget, \
    QHBoxLayout, QLineEdit, QTableWidget, QTableWidgetItem, QHeaderView, QAbstractItemView



def connect_to_database():
    try:
        password_encoded = urllib.parse.quote_plus("Password@123")
        connection_string = f"mssql+pymssql://sa:{password_encoded}@localhost:1433/teams"
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
        print(headers)
        return headers
    except Exception as e:
        print(f"Error fetching table: {e}")
        return None


def get_table_data(engine, table_name='teams'):
    try:
        metadata = db.MetaData()
        table = db.Table(table_name, metadata, autoload_with=engine)
        connection = engine.connect()
        query = db.select(table.columns)
        res_proxy = connection.execute(query)
        all_rows = res_proxy.fetchall()
        return all_rows
    except Exception as e:
        print(f"Error fetching table: {e}")
        return None


class TableWindow(QMainWindow):
    def __init__(self, db_conn, engine, table_name):
        super().__init__()
        self.db_conn = db_conn
        self.engine = engine

        self.setWindowTitle(f"Table: {table_name}")
        self.setGeometry(100, 100, 600, 400)  # (x, y, width, height)

        self.table_name = table_name
        self.layout = None
        # Fetch table data
        connection = self.db_conn
        try:
            headers = get_table_headers(engine, table_name)
            data = get_table_data(engine, table_name)
            print(data)
            print(headers)
            # Create table widget and populate with data
            self.table = QTableWidget()
            self.table.setColumnCount(len(headers))
            self.table.setRowCount(len(data))
            self.table.setHorizontalHeaderLabels(headers)

            for row_index, row in enumerate(data):
                for col_index, value in enumerate(row):
                    self.table.setItem(row_index, col_index, QTableWidgetItem(str(value)))

            # Resize columns to fit content
            self.table.horizontalHeader().setSectionResizeMode(QHeaderView.ResizeMode.ResizeToContents)

            # Enable complete row selection
            self.table.setSelectionMode(QAbstractItemView.SelectionMode.SingleSelection)
            self.table.setSelectionBehavior(QAbstractItemView.SelectionBehavior.SelectRows)

            # Layout
            self.layout = QVBoxLayout()
            self.layout.addWidget(self.table)

            # Set central widget
            central_widget = QWidget()
            central_widget.setLayout(self.layout)
            self.setCentralWidget(central_widget)

            # Create CRUD buttons
            create_button = QPushButton("Create")
            read_button = QPushButton("Read")
            update_button = QPushButton("Update")
            delete_button = QPushButton("Delete")

            # Connect CRUD buttons to methods
            create_button.clicked.connect(self.on_create_click)
            read_button.clicked.connect(self.on_read_click)
            update_button.clicked.connect(self.on_update_click)
            delete_button.clicked.connect(self.on_delete_click)

            # Layout for CRUD buttons
            buttons_layout = QHBoxLayout()
            buttons_layout.addWidget(create_button)
            buttons_layout.addWidget(read_button)
            buttons_layout.addWidget(update_button)
            buttons_layout.addWidget(delete_button)

            # Add CRUD buttons layout to main layout
            self.layout.addLayout(buttons_layout)
        except Exception as e:
            print(f"Error generating table data: {e}")

    def on_create_click(self):
        print("Create button clicked!")

    def on_read_click(self):
        print("Read button clicked!")

    def on_update_click(self):
        print("Update button clicked!")

    def on_delete_click(self):
        print("Delete button clicked!")


class MainWindow(QMainWindow):
    def __init__(self, db_conn, engine):
        super().__init__()
        self.db_conn = db_conn
        self.engine = engine

        self.setWindowTitle("TEAMS BACKUP PLATFORM")
        self.setGeometry(100, 100, 400, 300)  # (x, y, width, height)

        # Create label for Tables
        self.tables_label = QLabel("Tables:", self)
        self.tables_label.setGeometry(50, 50, 100, 30)

        # Create ComboBox for tables
        self.tables_combobox = QComboBox(self)
        self.tables_combobox.setGeometry(150, 50, 200, 30)

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
