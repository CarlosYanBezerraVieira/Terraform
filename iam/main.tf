provider "aws" {
  region = "us-east-1"
}

resource " aws_iam_user" "user" {
  name = "Yan"
}

resource "aws_iam_policy" "custom_policy" {
  name   = "MyCustomPolicy"
  policy = <<EOF
  {
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:DescribeCoipPools",
				"ec2:DescribeVerifiedAccessEndpoints",
				"ec2:DescribeLocalGatewayVirtualInterfaces",
				"ec2:DescribeNetworkInsightsPaths",
				"ec2:DescribeHostReservationOfferings",
				"ec2:DescribeVolumeStatus",
				"ec2:DescribeVolumes",
				"ec2:DescribeFpgaImageAttribute",
				"ec2:DescribeExportTasks",
				"ec2:DescribeTransitGatewayMulticastDomains",
				"ec2:DescribeManagedPrefixLists",
				"lambda:DeleteFunction",
				"ec2:DescribeKeyPairs",
				"ec2:GetVerifiedAccessEndpointPolicy",
				"lambda:GetEventSourceMapping",
				"ec2:DescribeVpcClassicLinkDnsSupport",
				"ec2:DescribeSnapshotAttribute",
				"ec2:DescribeIpamResourceDiscoveryAssociations",
				"ec2:DescribeInstanceEventWindows",
				"ec2:DescribeVolumeAttribute",
				"ec2:DescribeLocalGatewayVirtualInterfaceGroups",
				"ec2:DescribeVpcEndpointServicePermissions",
				"ec2:DescribeTransitGatewayAttachments",
				"ec2:DescribeAddressTransfers",
				"lambda:GetFunctionConcurrency",
				"ec2:SearchLocalGatewayRoutes",
				"ec2:DescribeTrunkInterfaceAssociations",
				"ec2:DescribeInstanceConnectEndpoints",
				"lambda:PutProvisionedConcurrencyConfig",
				"ec2:DescribeFleets",
				"lambda:PublishVersion",
				"ec2:DescribeAwsNetworkPerformanceMetricSubscriptions",
				"ec2:DescribeCapacityReservationBillingRequests",
				"lambda:DeleteEventSourceMapping",
				"ec2:DescribeMacHosts",
				"ec2:DescribeCapacityReservationFleets",
				"ec2:DescribePrincipalIdFormat",
				"ec2:DescribeFlowLogs",
				"ec2:DescribeRegions",
				"ec2:DescribeVpcEndpointServices",
				"ec2:DescribeSpotInstanceRequests",
				"ec2:DescribeVerifiedAccessTrustProviders",
			],
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
    name = "Attachment"
    users = [ aws_iam_user.user.name ]
    policy_arn = aws_iam_policy.custom_policy

  
}
