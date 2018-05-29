TAG_FULL=2.0.180425
TAG_TEST=test-2.0.180525
REPO=denkhaus/bitshares-2
BUILD_TYPE_FULL=RelWithDebInfo
BUILD_TYPE_TEST=RelWithDebInfo

up:
	@TAG_FULL=$(TAG_FULL) \
	TAG_TEST=$(TAG_TEST) \
	docker-compose up -d

stop:
	@TAG_FULL=$(TAG_FULL) \
	TAG_TEST=$(TAG_TEST) \
	docker-compose stop

rm:
	@TAG_FULL=$(TAG_FULL) \
	TAG_TEST=$(TAG_TEST) \
	docker-compose rm

restart: rm up

build_full:
	docker build --build-arg TAG=$(TAG_FULL) --build-arg BUILD_TYPE=$(BUILD_TYPE_FULL) -t $(REPO):$(TAG_FULL) .

push_full: build_full
	docker push $(REPO):$(TAG_FULL)

build_test:
	docker build --build-arg TAG=$(TAG_TEST) --build-arg BUILD_TYPE=$(BUILD_TYPE_TEST) -t $(REPO):$(TAG_TEST) .

push_test: build_test
	docker push $(REPO):$(TAG_TEST)




	