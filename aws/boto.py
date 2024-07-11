import boto3

# Define the AWS region
aws_region = 'us-west-1'  # Replace with your desired AWS region

# Initialize the S3 client with the specified region
s3_client = boto3.client('s3', region_name=aws_region)

# Define the bucket name (replace with your bucket name)
bucket_name = 'pycon-bucket'

# Create the S3 bucket with the correct region constraint
s3_client.create_bucket(Bucket=bucket_name, CreateBucketConfiguration={'LocationConstraint': aws_region})

# Print confirmation message
print(f"S3 bucket '{bucket_name}' created successfully in region '{aws_region}'.")
