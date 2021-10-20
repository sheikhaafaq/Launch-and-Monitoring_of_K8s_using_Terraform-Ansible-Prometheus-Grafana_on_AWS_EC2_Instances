
#--------->> For Launching Master Node <<--------
resource "aws_instance" "K8sMaster" {

      ami = "ami-0a23ccb2cdd9286bb"

      instance_type = var.MasterType      

      security_groups = ["k8s_sg"]

      key_name = "awskey"

      tags = {

           Name = "MasterNode"
           
      }
}

#-------->> For Launching Slave Node1 <<---------
resource "aws_instance" "K8sSlaves" {
      count = 2
      ami = "ami-0a23ccb2cdd9286bb"

      instance_type = var.SlaveType

      security_groups = ["k8s_sg"]

      key_name = "awskey"

      tags = {
          Name = "SlaveNode-${ count.index + 1 }" 
      }
}


