resource "azuread_named_location" "Lubmin2" {
  display_name = "location1"
  ip {
    ip_ranges = [
      "45.142.20.72/32"
    ]
    trusted = false
  }
}