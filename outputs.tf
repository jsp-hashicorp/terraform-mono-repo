output "nomad_job_status" {
    value = data.nomad_job.result.status
}