

# Menu card - vehicle rates per km
rates = {
    'Economy' : 10,    # Rs.10 per km
    'Premium' : 18,    # Rs.18 per km
    'SUV'     : 25     # Rs.25 per km
}

# FUNCTION: Calculate the fare

def calculate_fare(km, vehicle, hour):

    # Look up rate from menu card
    rate = rates[vehicle]

    # Base fare = distance x rate
    base_fare = km * rate

    # Check if peak hours (5PM to 8PM)
    if 17 <= hour <= 20:
        final_fare = base_fare * 1.5   # surge applied
        surge = True
    else:
        final_fare = base_fare          # no surge
        surge = False

    return base_fare, final_fare, surge

# MAIN PROGRAM - Get inputs from user

print()
print("  ================================")
print("        CityCab FareCalc          ")
print("  ================================")
print("  Welcome! Let us calculate")
print("  your ride fare.")
print("  ================================")

# ── Ask for distance ──────────────────────
while True:
    try:
        km = float(input("\n  Enter distance in km: "))
        if km <= 0:
            print("  Distance must be greater than 0.")
            continue
        break
    except ValueError:
        print("  Please enter a valid number.")

# ── Ask for vehicle type ──────────────────
print()
print("  Available vehicles:")
print("  - Economy  (Rs.10/km)")
print("  - Premium  (Rs.18/km)")
print("  - SUV      (Rs.25/km)")

while True:
    vehicle = input("\n  Enter vehicle type: ").strip().title()
    if vehicle in rates:
        break
    else:
        print("  Sorry, that vehicle is not available.")
        print("  Please choose Economy, Premium or SUV.")

# ── Ask for hour of day ───────────────────
while True:
    try:
        hour = int(input("\n  Enter hour of day (0 to 23): "))
        if 0 <= hour <= 23:
            break
        else:
            print("  Please enter a number between 0 and 23.")
    except ValueError:
        print("  Please enter a valid number.")

# CALCULATE AND PRINT RECEIPT

base_fare, final_fare, surge = calculate_fare(km, vehicle, hour)

print()
print("  ================================")
print("         Your Price Receipt       ")
print("  ================================")
print(f"  Vehicle    : {vehicle}")
print(f"  Distance   : {km} km")
print(f"  Rate       : Rs.{rates[vehicle]}/km")
print(f"  Base Fare  : Rs.{base_fare:.2f}")

if surge:
    print(f"  Surge      : 1.5x (Peak Hours)")
else:
    print(f"  Surge      : None")

print(f"  --------------------------------")
print(f"  Total Fare : Rs.{final_fare:.2f}")
print("  ================================")

if surge:
    print("  Note: Peak hour (5PM to 8PM)")
    print("  surcharge has been applied.")

print()
print("  Thank you for choosing CityCab!")
print("  Have a safe journey!")
print("  ================================")