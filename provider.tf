provider "google" {
  credentials = "${file("./key1.json")}"
  project     = "gcp-practice-project-340110"
}
