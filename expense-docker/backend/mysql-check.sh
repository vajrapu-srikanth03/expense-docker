# MYSQL_CONTAINER="mysql"
# MYSQL_USER="root"
# MYSQL_PASS="ExpenseApp@1"

# check_mysql() {
#     docekr exec "$MYSQL_CONTAINER" mysqladmin -u "$MYSQL_USERt" -p"$MYSQL_PASS" ping --silent
# }

# for i in {1..60}; do
#     if check_mysql; then
#         echo "MYSQL is ready!"
#         break
#     else
#         echo "Waiting for MYSQL to be ready..."
#         sleep 5
#     fi
# done
echo "Waiting for MySQL to be ready..."

# Simple MySQL connection check
until mysql ping -h mysql --silent; do
    echo "MySQL is unavailable - sleeping"
    sleep 2
done

echo "MySQL is up and running!"
