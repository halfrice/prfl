# Use lightweight Alpine image with Node:10 LTS version
FROM mhart/alpine-node:10

# Create a new group and user for the container to use 
# instead of default root user.
# Install latest version of npm, find for now, though 
# in finality we should specify a specific version.
RUN addgroup -g 1001 -S prfl &&\
  adduser -u 1001 -S prfl -G prfl -h /prfl &&\
  npm i -g npm@latest

# Expose port 4200 to work with angular development server
EXPOSE 4200

# Use our app name as home folder in root because forget
# typing /home/app/prfl/whatever/dude/ everytime.
ENV HOME=/prfl

# Copy package.json over to container
COPY package.json package-lock.json* $HOME/

# Set permissions for new user
# NOTE: The previous copy command gave ownership to root,
# so we chown them to our new user.
# NOTE2: It has to be done this way otherwise ownership
# permissions get janky.
RUN chown -R prfl:prfl $HOME

# Use our new user
USER prfl

# Set the current working directory
WORKDIR $HOME

# Install dependencies and trash downloaded .tar files
RUN npm install --no-optional && npm cache clean --force

# Start the angular development server.
CMD npm start -- --host 0.0.0.0 --poll 500
