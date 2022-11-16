# Test and deploy helm charts

## Using this action
    
```yaml 
name: Test and deploy helm charts
on:
    push:
jobs:   
    validate_chart:
        runs-on: ubuntu-latest
        container: 
            image: quay.io/helmpack/chart-testing:v3.5.0
        steps:
        - uses: actions/checkout@v2
        - name: Test and deploy helm charts
            uses: forestsoftgmbh/gh-chart-action@main
            with:
                chart: ./path/to/chart
                deploy_token: ${{ secrets.HELM_CHART_REPO_TOKEN }}
                release: false
```