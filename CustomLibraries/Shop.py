from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop():
    def __init__(self):
        self.seleniumLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def add_items_to_card_and_verify_badge(self, productsList):
        i=1
        selected_count = 0
        productsTitles= self.seleniumLib.get_webelements("css:.inventory_item_name")
        for productTitle in productsTitles:
            if productTitle in productsList:
                self.seleniumLibrary.click_button("(//div[@class='pricebar']/button)["+str(i)+"]")
                selected_count += 1
                self.verify_shopping_cart_badge(selected_count)
            i=i+1

    @keyword
    def verify_shopping_cart_badge(self, expected_count):
        #Checks that the number displayed in the shopping cart badge is correct
        badge_locator = "css:.shopping_cart_badge"

        # Checks that the badge is present
        if self.seleniumLib.is_element_present(badge_locator):
            cart_badge_text = self.seleniumLib.get_text(badge_locator)
            cart_badge_count = int(cart_badge_text.strip())  #Convert to integer
            assert cart_badge_count == expected_count, f"Erreur: {cart_badge_count} instead of {expected_count}"
        else:
            assert expected_count == 0, f"Error: Badge not displayed but {expected_count} items added"

