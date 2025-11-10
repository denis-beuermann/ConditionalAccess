resource "azuread_named_location" "location1" {
  provider = azuread.personal
  display_name = "location1"
  ip {
    ip_ranges = [
      "45.142.20.72/32"
    ]
    trusted = false
  }
}