# Everyday commands. Run `make` to see them.
RUN = docker compose run --rm --no-deps site

.PHONY: help serve build post draft publish update clean

help:
	@echo "make serve                 preview at http://localhost:4000 (drafts included, live reload)"
	@echo "make post  t=\"My title\"    new post in _posts/ dated today"
	@echo "make draft t=\"My title\"    new unpublished draft in _drafts/"
	@echo "make publish f=_drafts/x.md  move a draft to _posts/ with today's date"
	@echo "make build                 production build into _site/ (what GitHub will publish)"
	@echo "make update                update Jekyll and plugins (Gemfile.lock)"

serve:
	docker compose up

build:
	$(RUN) sh -c "bundle install --quiet && JEKYLL_ENV=production bundle exec jekyll build"

post:
	@bin/new-post "$(t)"

draft:
	@bin/new-post "$(t)" --draft

publish:
	@bin/publish "$(f)"

update:
	$(RUN) sh -c "bundle update && bundle lock --add-platform x86_64-linux"

clean:
	rm -rf _site .jekyll-cache
