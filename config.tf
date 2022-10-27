terraform {
    backend "s3" {
        bucket = "terraform-state-1010101"
        key    = "state/matchup_repo_state"
        region = "eu-central-1"
    }
}