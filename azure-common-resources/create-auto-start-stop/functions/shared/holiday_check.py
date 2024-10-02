import datetime
import os
import holidays

def is_holiday():
    COUNTRY = os.environ.get("HOLIDAY_COUNTRY", "FR")  # Default to FR
    SOLIDARITY_DAY = os.environ.get("SOLIDARITY_DAY")  # Format: "DD-MM"

    country_holidays = holidays.country_holidays(COUNTRY)
    today = datetime.datetime.utcnow().date()

    is_regular_holiday = today in country_holidays
    is_solidarity_day = SOLIDARITY_DAY and today.strftime("%d-%m") == SOLIDARITY_DAY    

    return is_regular_holiday and not is_solidarity_day