#-------->> Inventory creation <<------------------
resource "local_file" "f1" {
    content = "[MasterNode] \n${aws_instance.K8sMaster.public_ip}\n[SlaveNodes] \n${aws_instance.K8sSlaves[0].public_ip} \n${aws_instance.K8sSlaves[1].public_ip}"
    filename = "/etc/ansible/inventory/inventory.txt"
}

resource "null_resource"  "RunAnsiblePlaybook" {
        provisioner  "local-exec" {
        command = "sudo ansible-playbook ../ansibleWS/main.yml"
	}
	depends_on = [ aws_instance.K8sMaster, aws_instance.K8sSlaves ]
}
