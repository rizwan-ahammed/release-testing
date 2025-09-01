#!/bin/bash

# Function to generate random log messages
generate_random_log() {
    local messages=(
        "Database migration started"
        "Creating table users"
        "Adding index on email column"
        "Migrating data from old schema"
        "Database migration completed successfully"
        "API server starting up"
        "Connected to database"
        "Listening on port 8080"
        "Health check endpoint ready"
        "Request processed successfully"
        "User authentication completed"
        "Data validation passed"
        "Cache updated successfully"
        "Background job queued"
        "Error handling middleware active"
        "Cache miss"
    )
    
    local random_index=$((RANDOM % ${#messages[@]}))
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ${messages[$random_index]}"
}

# Function to generate random error logs
generate_random_error() {
    local errors=(
        "Connection timeout to database"
        "Invalid input data received"
        "Permission denied for resource"
        "Rate limit exceeded"
        "Service temporarily unavailable"
        "Validation failed for user input"
        "Cache miss occurred"
        "Background job failed"
        "Memory usage high"
        "Disk space low"
    )
    
    local random_index=$((RANDOM % ${#errors[@]}))
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: ${errors[$random_index]}"
}

# Check environment variable
if [ "$ENV" = "db_migrate" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting database migration process..."
    
    # Generate 5-10 random migration logs
    local count=$((5 + RANDOM % 6))
    for i in $(seq 1 $count); do
        generate_random_log
        sleep 1
    done
    
    # Generate 1-3 error logs
    local error_count=$((1 + RANDOM % 3))
    for i in $(seq 1 $error_count); do
        generate_random_error
        sleep 1
    done
    
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Database migration process completed"
    exit 0

elif [ "$ENV" = "api" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting API server..."
    
    # Continuous log generation
    while true; do
        # 80% chance of success log, 20% chance of error log
        if [ $((RANDOM % 5)) -eq 0 ]; then
            generate_random_error
        else
            generate_random_log
        fi
        
        # Sleep for 2-5 seconds
        sleep $((2 + RANDOM % 4))
    done

else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Unknown environment: $ENV"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Available environments: 'db_migrate' or 'api'"
    exit 1
fi
