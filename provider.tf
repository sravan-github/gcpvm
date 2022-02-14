provider "google" {
  credentials = "${file("/home/sravangcp/key.json")}"
  project     = "gcp-practice-project-340110"
}