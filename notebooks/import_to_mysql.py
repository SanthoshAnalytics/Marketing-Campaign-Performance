import pandas as pd
from sqlalchemy import create_engine

# Read CSV
df = pd.read_csv(
    r"C:\Users\admin\Downloads\OneDrive\python\Marketing-Campaign-Performance\notebooks\cleaned_marketing_campaign.csv"
)

# Convert Date column
df["Date"] = pd.to_datetime(df["Date"])

# Connect to MySQL
engine = create_engine(
    "mysql+pymysql://root:Aaraay%40277@localhost:3306/marketing_campaign_db"
)

# Import Data
df.to_sql(
    "marketing_campaign",
    con=engine,
    if_exists="append",
    index=False,
    chunksize=5000,
    method="multi"
)

print("Data Imported Successfully!")