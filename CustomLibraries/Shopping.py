from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shopping():
    def __init__(self):
        self.seleniumLib= BuiltIn.get_library_instance("SeleniumLibrary")

    @keyword
    def add_items_to_card_and_checkout(self,productsList):
        productsTitles= self.seleniumLib.get_webelements("Sauce Labs Fleece Jacket")
        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                self.seleniumLib.click_button("xpath:(//button[text()='Add to cart'])["+str(i)+"]/button")
            i = i+1
        self.seleniumLib.click_link("css:.shopping_cart_link")
