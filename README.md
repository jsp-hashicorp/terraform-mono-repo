# terraform-mono-repo

Terraform 사용 시 단일 저장소를 사용하여 Terraform Cloud/Enterprise를 사용하는 방법에 대한 소개를 위한 저장소입니다.

OSS를 사용하여 Terraform Configuration Template을 작성하게 되면 다음과 같이 디렉토리 구조를 가져가게 됩니다.


Terraform Configuration Template 작성 후 VCS 상의 저장소와 Workspace를 연동하는 방법은 다음과 같이 기본적으로 3가지 방안이 가능합니다.

- 1 Repo = 1 Workspace
- 1 Directory = 1 Workspace (Repo상 하나의 디렉토리를 하나의 Workspace와 연동)
- 1 Branch = 1 Workspace (Repo 상 하나의 Branch와 하나의 Workspace를 연동)

실제는 3가지 방식을 혼합하여 상황에 맞게 사용하는 것이 일반적입니다.

