resource "github_repository" "repository_template_test" {
  name         = "template_test"
  has_issues   = true
  has_projects = true
  auto_init    = true
  is_template  = true
}

resource "github_repository_file" "sonar_project_properties" {
  repository = github_repository.repository_template_test.name
  branch     = "main"
  file       = "test.txt"
  content    = "test"
  overwrite_on_create = true
}