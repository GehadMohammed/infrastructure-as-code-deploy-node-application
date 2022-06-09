terraform {
  backend "s3" {
    bucket = "backend-jenkines-gahoda"
    key    = "terraform"
    region = "us-east-1"
  }
}
