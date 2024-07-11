from cdktf import App, TerraformStack
from constructs import Construct

from imports.aws.provider import AwsProvider
from imports.aws.instance import Instance


class MyStack(TerraformStack):
    def __init__(self, scope: Construct, id: str):
        super().__init__(scope, id)

        AwsProvider(self, "AWS", region="us-west-2")

        Instance(self, "Compute",
                 ami="ami-12345678",
                 instance_type="t2.micro")


app = App()
MyStack(app, "python-terraform")

app.synth()
