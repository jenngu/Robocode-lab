# +
from robot.libraries.OperatingSystem import OperatingSystem

os = OperatingSystem()
EXCEL_FILE_PATH = os.normalize_path(__file__ + "/../../devdata/Data.xlsx")
