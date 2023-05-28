import smtplib

RECEIVER = "shoysoronovr@gmail.com"
MY_EMAIL = "python.pract16e@gmail.com"
PASSWORD = "iietrkbfminnlhtn"

connection = smtplib.SMTP("smtp.gmail.com", port=587)
connection.starttls()
connection.login(user=MY_EMAIL, password=PASSWORD)
connection.sendmail(from_addr=MY_EMAIL, to_addrs=RECEIVER, msg="Hello")
connection.close()
