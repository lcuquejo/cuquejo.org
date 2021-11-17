FROM node:17.1.0-stretch AS base

EXPOSE 3000

ENV HOST='0.0.0.0'
ENV PORT=3000

WORKDIR /app

RUN groupadd -g 1003 cuquejo_org
RUN useradd -u 1003 -g 1003 -d /app cuquejo_org
COPY cuquejo.org /app
RUN chown -R cuquejo_org:cuquejo_org /app

USER cuquejo_org

FROM base AS test
RUN yarn test --watchAll=false

FROM base AS prod-build
RUN yarn build

FROM nginx:1.19-alpine as prod
RUN rm -rf /usr/share/nginx/html
COPY docker/default.conf /etc/nginx/conf.d/default.conf
COPY --from=prod-build /app/build /usr/share/nginx/html

FROM base AS dev
RUN yarn install
RUN npx browserslist@latest --update-db

CMD ["yarn", "start"]