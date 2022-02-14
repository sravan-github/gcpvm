provider "google" {
  credentials = "${file("./key2.json")}"
  project     = "gcp-practice-project-340110"
}
