name: Node CI
on: [push]
jobs: ## job 들을 명시
  build: ## job id
    name: Build
    runs-on: ubuntu-latest ## 해당 job의 구동 환경을 정의
    strategy:
      matrix:
        node-version: [8.x, 10.x, 12.x]
    steps:
      - uses: actions/checkout@v1
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v1
        with:
          node-version: ${{ matrix.node-version }}
      - name: Npm Install, build and test
        run: |
          npm install
          npm ci
          npm run build --if-present
          npm test
      - name: Checkout source code ## 소스코드를 checkout 하는 step
        uses: actions/checkout@v2
      - name: Cache yarn dependencies ## yarn dependencies를 cache 하는 step
        uses: actions/cache@v1
        id: yarn-cache
        with:
          path: node_modules
          key: ${{ runner.os }}-yarn-${{ hashFiles('**/yarn.lock') }}
          restore-keys: |
            ${{ runner.os }}-yarn-
