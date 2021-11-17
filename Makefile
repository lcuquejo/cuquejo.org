VERSION=1.1
NAME=cuquejo-org

build:
	docker build -t leonardocuquejo/${NAME}:${VERSION} --target=prod -f docker/Dockerfile  .

build-ci:
	docker build -t ${REGISTRY_URL}/${GOOGLE_PROJECT_ID}/cuquejo/${CIRCLE_PROJECT_REPONAME}:${TAG} --target=prod -f docker/Dockerfile  .

push-ci:
	docker push ${REGISTRY_URL}/${GOOGLE_PROJECT_ID}/cuquejo/${CIRCLE_PROJECT_REPONAME}:${TAG}

test:
	docker build -t leonardocuquejo/${NAME}:${VERSION} --target=test -f docker/Dockerfile  .

up: build
	docker run -p 3000:3000 -d --rm --name ${NAME} leonardocuquejo/${NAME}:${VERSION}

dev-build:
	docker build -t leonardocuquejo/${NAME}:${VERSION}-dev --target=dev -f docker/Dockerfile  .

dev-up: dev-build
	docker run -p 3000:3000 -d --rm --name ${NAME}-dev leonardocuquejo/${NAME}:${VERSION}-dev

down:
	docker stop ${NAME}

dev-down:
	docker stop ${NAME}-dev

publish: build
	docker push leonardocuquejo/${NAME}:${VERSION}
	echo "Update prod server:"
	echo "docker run -p 80:3000 -p 443:443 -d --restart=always leonardocuquejo/${NAME}:${VERSION}"
