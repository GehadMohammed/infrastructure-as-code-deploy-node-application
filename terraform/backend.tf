terraform {
  backend "s3" {
    bucket = "backend-tf-g"
    key    = "terraform"
    region = "us-east-1"
    # access_key="AKIA5FN7V27KIV5SL26R"
    # secret_key="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"

  }
}