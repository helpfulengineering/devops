/*--------------------------------

Guide: Make sure to add owners id
For DevOps-SG, make an extra ingress for the app

----------------------------------------------*/

provider "aws" {
	region = "${var.region}"
}


data "aws_ami" "WINDOWS" {
	most_recent = true
	filter {
		name = "name"
		values = ["HELPFUL ENGINEER Windows 2016*"]
	}
	owners = [""]
}

data "aws_ami" "CENTOS" {
	most_recent = true
	filter {
		name = "name"
		values = ["HELPFUL ENGINEER CENTOS*"]

	}
	owners = [""]
}

/*----------------  Resources ----------------

resource "aws_security_group" "Helpful Engineer DevOps-SG" {
	vpc_id = "${var.vpc_id}"
	name = "${var.Security-Group-name}"


	/* note, this could be changed for node or react app */
	ingress {
		from_port = 3000
		to_port = 3000
		protocol = "tcp"
		cidr_blocks = [""]
		description = "Ruby on rails app"
	}

	ingress {
		from_port = 3389
		to_port = 3389
		protocal = "tcp"
		cidr_blocks = ["10.0.0.0/8"]
		description = "For RDP"
	}

	ingress {
		from_port = 8
		to_port = -1
		protocol = "icmp"
		cidr_blocks = ["10.0.0.0/8"] 
		description = "Allow ping"
	}

	ingress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		self = true
		description = "For traffic within the SG"
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"] 
		description = "Allow traffic out"
	}

}


/*----------------  Virtual Machine ----------------

resource "aws_instance" "HE-Utility" {
	ami = "${data.aws_ami.CENTOS.id}"
	subnet_id = "${var.subnet_id_az}"
	instance_type = "${var.Utility_instance-type}"
	root block device {
		volume_size = "${var.Utility_volume-size}"
		volume_type = "gp2"	
	}

	vpc_security_group_ids = ["${security_group_Helpful_Enginner_default_linux}", "${aws_security_group.DevOps-SG.id}"]
	key_name = "${var.key_name}"
	disable_api_termination = "${var.termination-protection}"
	monitoring = "${var.cloud-watch}"
	iam_instance_profile = "HelpfulEngineerVpcAccess"

	lifecycle {
		ignore_changes = ["ami", "user_data"]
	}

	user_data = <<-EOF
		#!/bin/bash
		hostnamect1 set-hostname "host-name-here"
		EOF

	tags {
		SoftwareTeam = "${var.SoftwareTeam}"
		SoftwareTeamLead = "${var.SoftwareTeamLead}"
		Application = "${var.Application}"
		Environment = "${var.Environment}"

	}
}
