FROM mysql:8.0

# Set environment variable for MySQL root password
#ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1

# Create a non-root user and group, and set ownership in one step
RUN groupadd -r expense && \
    useradd -r -g expense expense && \
    chown -R expense:expense /var/lib/mysql /var/run/mysqld /docker-entrypoint-initdb.d

# Copy SQL scripts into the init directory
COPY scripts/*.sql /docker-entrypoint-initdb.d

# Switch to the non-root user
USER expense