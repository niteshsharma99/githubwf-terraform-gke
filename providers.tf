provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
#  credentials = file("gcp-credentials.json")
}

provider "kubernetes" {
   config_path    = ${{ secrets.KUBE_CONFIG }}
#  config_context = "my-cluster"
}

terraform {
  backend "gcs" {
    bucket = "devops-project-376006-tfstate"
    prefix = "terraform/state"
#    impersonate_service_account = "terraform-github-wf-sa@devops-project-376006.iam.gserviceaccount.com"
  }
}
