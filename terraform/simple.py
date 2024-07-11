import os

from cdktf import App, TerraformStack, TerraformOutput, LocalBackend
from constructs import Construct

from imports.aws.provider import AwsProvider
from imports.aws.instance import Instance


class MyStack(TerraformStack):
    def __init__(self, scope: Construct, id: str):
        super().__init__(scope, id)

        AwsProvider(self, "AWS", region="us-west-1")


        # Get the root directory of your project
        root_dir = os.path.abspath(os.path.dirname(__file__))

        # Configure local state backend
        LocalBackend(self, path=os.path.join(root_dir, "states/terraform.tfstate"))

        instance = Instance(self, "compute",
                            ami="ami-01456a894f71116f2",
                            instance_type="t2.micro",
                            tags={"Name": "pycon-talk"},
                            )

        TerraformOutput(self, "public_ip",
                        value=instance.public_ip,
                        )


app = App()
MyStack(app, "pycon-terraform-cdk")

app.synth()
