import pandas as pd
import random
from faker import Faker
from datetime import datetime, timedelta

fake = Faker("en_IN")

# -----------------------
# SETTINGS
# -----------------------
NUM_PASSENGERS = 35000
NUM_BOOKINGS = 100000

start_date = datetime(2023, 1, 1)
end_date = datetime(2025, 12, 31)

# -----------------------
# TRAINS DATA
# -----------------------
trains = []

train_categories = [
    "Rajdhani",
    "Shatabdi",
    "Duronto",
    "Superfast",
    "Express",
    "Intercity"
]

zones = [
    "South Central",
    "East Coast",
    "Southern",
    "Western",
    "Northern"
]

cities = [
    "Hyderabad",
    "Visakhapatnam",
    "Vijayawada",
    "Guntur",
    "Chennai",
    "Bengaluru",
    "Mumbai",
    "Delhi",
    "Kolkata",
    "Pune"
]

for i in range(1, 121):
    source = random.choice(cities)
    destination = random.choice(
        [c for c in cities if c != source]
    )

    trains.append([
        f"TR{i:03}",
        fake.company() + " Express",
        source,
        destination,
        random.choice(train_categories),
        random.randint(100, 2500),
        round(random.uniform(2, 30), 1),
        random.randint(200, 5000),
        random.choice(zones)
    ])

train_df = pd.DataFrame(
    trains,
    columns=[
        "train_id",
        "train_name",
        "source_station",
        "destination_station",
        "train_category",
        "distance_km",
        "avg_travel_hours",
        "base_fare",
        "zone"
    ]
)

# -----------------------
# PASSENGERS DATA
# -----------------------
states = [
    "Andhra Pradesh",
    "Telangana",
    "Tamil Nadu",
    "Karnataka",
    "Maharashtra",
    "Delhi"
]

occupations = [
    "Student",
    "IT Employee",
    "Doctor",
    "Business Owner",
    "Teacher",
    "Government Employee"
]

passengers = []

for i in range(1, NUM_PASSENGERS + 1):

    occupation = random.choice(occupations)

    passengers.append([
        f"P{i:05}",
        random.choice(["Male", "Female"]),
        random.choice([
            "18-25",
            "26-35",
            "36-50",
            "50+"
        ]),
        random.choice(states),
        random.choice([
            "Business",
            "Personal"
        ]),
        occupation,
        random.choice([
            "Low",
            "Medium",
            "High"
        ])
    ])

passenger_df = pd.DataFrame(
    passengers,
    columns=[
        "passenger_id",
        "gender",
        "age_group",
        "state",
        "travel_type",
        "occupation",
        "travel_frequency"
    ]
)

# -----------------------
# BOOKINGS DATA
# -----------------------
ticket_types = [
    "General",
    "Tatkal",
    "Premium Tatkal"
]

travel_classes = [
    "SL",
    "3A",
    "2A",
    "1A",
    "CC"
]

payment_methods = [
    "UPI",
    "Card",
    "Net Banking",
    "Wallet"
]

booking_statuses = [
    "Confirmed",
    "RAC",
    "Waiting",
    "Cancelled"
]

bookings = []

for i in range(1, NUM_BOOKINGS + 1):

    booking_date = fake.date_between(
        start_date=start_date,
        end_date=end_date
    )

    journey_date = booking_date + timedelta(
        days=random.randint(1, 30)
    )

    train = random.choice(trains)

    bookings.append([
        f"BK{i:06}",
        f"P{random.randint(1, NUM_PASSENGERS):05}",
        train[0],
        booking_date,
        journey_date,
        random.choice(ticket_types),
        random.choice(travel_classes),
        random.randint(200, 5000),
        random.choice(booking_statuses),
        random.choice(payment_methods),
        random.choice([
            "Mobile App",
            "Website"
        ]),
        random.randint(50, 100),
        random.randint(0, 180),
        train[8],
        random.choice([
            "Summer",
            "Winter",
            "Festival",
            "Monsoon"
        ]),
        random.choice([
            "Yes",
            "No"
        ])
    ])

booking_df = pd.DataFrame(
    bookings,
    columns=[
        "booking_id",
        "passenger_id",
        "train_id",
        "booking_date",
        "journey_date",
        "ticket_type",
        "travel_class",
        "fare_amount",
        "booking_status",
        "payment_method",
        "booking_channel",
        "seat_occupancy",
        "delay_minutes",
        "railway_zone",
        "season",
        "is_weekend"
    ]
)

# -----------------------
# SAVE CSV FILES
# -----------------------
train_df.to_csv(
    "Dataset/dim_trains.csv",
    index=False
)

passenger_df.to_csv(
    "Dataset/dim_passengers.csv",
    index=False
)

booking_df.to_csv(
    "Dataset/fact_bookings.csv",
    index=False
)

print("IRCTC Dataset Generated Successfully!")