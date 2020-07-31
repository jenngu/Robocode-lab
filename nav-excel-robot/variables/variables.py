# +
from robot.libraries.OperatingSystem import OperatingSystem

os = OperatingSystem()
excel_file_path = os.normalize_path(__file__ + "/../../devdata/customerprice.xlsx")
