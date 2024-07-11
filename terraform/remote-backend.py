from cdktf import App, TerraformStack, TerraformOutput, S3Backend
from constructs import Construct

from imports.aws.provider import AwsProvider
from imports.aws.instance import Instance


class MyStack(TerraformStack):
    def __init__(self, scope: Construct, id: str):
        super().__init__(scope, id)

        # Define AWS provider
        AwsProvider(self, "AWS", region="us-west-2")

        # Configure remote state backend (S3 bucket)
        S3Backend(self,
                  bucket="my-terraform-state-bucket",
                  key="terraform.tfstate",
                  region="us-west-2")

        # Define resources
        instance = Instance(self, "Compute",
                            ami="ami-12345678",
                            instance_type="t2.micro")

        # Output instance details
        TerraformOutput(self, "instance_id",
                        value=instance.id,
                        description="ID of the created instance")


# Create an App instance and stack
app = App()
MyStack(app, "python-terraform-cdk")

# Synthesize the Terraform code
app.synth()