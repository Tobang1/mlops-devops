gitlab-runner register  --url https://gitlab.com  --token glrt-uG6iP2o_c998xvwrSAyN



This deployment will be incomplete until you provide the URL that your
GitLab instance is reachable at:

    helm upgrade gitlab-runner \
        --set gitlabUrl=http://gitlab.your-domain.com,runnerRegistrationToken=your-registration-token \
        gitlab/gitlab-runner

Runner namespace "gitlab-runner" was found in runners.config template.
joe@SODG:~/mlops/mlops-devops$ 