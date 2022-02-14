provider "google" {
  credentials = "${file("./key.json")}"
  project     = "gcp-practice-project-340110"
}
