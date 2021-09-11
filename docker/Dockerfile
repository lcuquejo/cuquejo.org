FROM node:latest

EXPOSE 3000

ENV HOST='0.0.0.0'
ENV PORT=3000

WORKDIR /app

RUN groupadd -g 1003 cuquejo_org
RUN useradd -u 1003 -g 1003 -d /app cuquejo_org
COPY cuquejo.org /app
RUN chown -R cuquejo_org:cuquejo_org /app

USER cuquejo_org

RUN yarn install
RUN npx browserslist@latest --update-db

CMD ["yarn", "start"]