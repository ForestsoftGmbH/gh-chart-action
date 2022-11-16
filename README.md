# Test and deploy helm charts

## Using this action
    
```yaml 
name: Test and deploy helm charts
on:
    push:
jobs:   
    validate_chart:
        runs-on: ubuntu-latest
        steps:
        - uses: actions/checkout@v2
        - name: Test and deploy helm charts
            uses: forestsoftgmbh/gh-chart-action@v1
            with:
                chart: ./path/to/chart
                deploy_token: ${{ secrets.HELM_CHART_REPO_TOKEN }}
                release: false
```