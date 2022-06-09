terraform {
  backend "s3" {
    bucket = "backend-jenkines-gahoda"
    key    = "terraform"
    region = "us-east-1"

     access_key="AKIA6CGBRS3AL7BGOWKE"
     secret_key="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"
  }
}
