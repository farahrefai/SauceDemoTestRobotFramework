from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop():
    def __init__(self):
        self.seleniumLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_card_and_checkout(self, productsList):
        i=1
        productsTitles= self.seleniumLib.get_webelements("css:.inventory_item_name")
        for productTitle in productsTitles:
            if productTitle in productsList:
                self.seleniumLibrary.click_button("(//div[@class='pricebar']/button)["+str(i)+"]")
            i=i+1

