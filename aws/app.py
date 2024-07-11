#!/usr/bin/env python3
import os
from aws_cdk import (
    App,
    Stack,
    aws_ec2 as ec2,
    CfnOutput,
    Environment
)
from constructs import Construct

class AwsStack(Stack):

    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        # Retrieve the default VPC for the specified region
        default_vpc = ec2.Vpc.from_lookup(self, "DefaultVpc", is_default=True)

        # Define an Amazon Linux EC2 instance
        ec2_instance = ec2.Instance(self, "MyInstance",
                                    instance_type=ec2.InstanceType("t2.micro"),
                                    machine_image=ec2.MachineImage.latest_amazon_linux2(),
                                    vpc=default_vpc)

        # Output the public IP of the instance
        self.output_public_ip(ec2_instance)

    def output_public_ip(self, ec2_instance: ec2.Instance) -> None:
        CfnOutput(self, "InstancePublicIP",
                  value=ec2_instance.instance_public_ip,
                  description="Public IP Address of the EC2 instance")


# Initialize the CDK app
app = App()
account = os.getenv('CDK_DEFAULT_ACCOUNT')
region = "us-west-1"

if not account or not region:
    raise ValueError("Environment variables CDK_DEFAULT_ACCOUNT and CDK_DEFAULT_REGION must be set")

AwsStack(app, "MyAwsStack", env=Environment(account=account, region=region))
app.synth()