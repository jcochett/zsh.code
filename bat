#!/usr/bin/python
''' Print battery statistics to the command line '''
import datetime

dt = datetime.datetime.now()

# For linux: the files that hold the battery information
charge_now ='/sys/bus/acpi/drivers/battery/PNP0C0A:00/power_supply/BAT0/charge_now'
charge_full ='/sys/bus/acpi/drivers/battery/PNP0C0A:00/power_supply/BAT0/charge_full'
status ='/sys/bus/acpi/drivers/battery/PNP0C0A:00/power_supply/BAT0/status'
now = 1
full = 1
stat = "?"


# Open files and extract information
with open(charge_now) as file_object:
    for line in file_object:
        now = line.rstrip()

with open(charge_full) as file_object:
    for line in file_object:
        full = line.rstrip()

with open(status) as file_object:
    for line in file_object:
        stat = line.rstrip()

# Calculate the battery percentage remaining
bat = int(now) / int(full) * 100

# Change the 'state' to an icon 
if (stat.lower() == "charging"):
    stat = "\u26A1"
elif (stat.lower() == "discharging"):
    stat = "\u231B"
elif (stat.lower() == "full"):
    stat = "\u26AE"
else:
    stat = "\u26A0"

# Print the information
print(dt.strftime("%T %F"), " {0:.2f}%".format(bat), stat)
