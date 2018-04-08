{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ __('title.archive') }} | {{ config.title }}{% endblock %}

{% block page_class %} page-archive {% endblock %}

{% block content %}

  {#####################}
  {### ARCHIVE BLOCK ###}
  {#####################}
  <div class="post-block archive">
    <div id="posts" class="posts-collapse">
      <span class="archive-move-on"></span>

      <span class="archive-page-counter">
        {% set cheers %}
        {% set posts_length = site.posts.length %}
        {% if posts_length > 210 %} {% set cheers = 'excellent' %}
          {% elif posts_length > 130 %} {% set cheers = 'great' %}
          {% elif posts_length > 80 %} {% set cheers = 'good' %}
          {% elif posts_length > 50 %} {% set cheers = 'nice' %}
          {% elif posts_length > 30 %} {% set cheers = 'ok' %}
        {% else %}
          {% set cheers = 'um' %}
        {% endif %}
        {{ __('cheers.' + cheers) }}! {{ _p("counter.archive_posts", site.posts.length) }} {{ __('keep_on') }}
      </span>

      {% for post in page.posts %}

        {# Show year #}
        {% set year %}
        {% set post.year = date(post.date, 'YYYY') %}

        {% if post.year !== year %}
          {% set year = post.year %}
          <div class="collection-title">
            <h2 class="archive-year motion-element" id="archive-year-{{ year }}">{{ year }}</h2>
          </div>
        {% endif %}
        {# endshow #}

        {{ post_template.render(post) }}

      {% endfor %}

    </div>
  </div>
  {#########################}
  {### END ARCHIVE BLOCK ###}
  {#########################}
<div id="container"></div>
<link rel="stylesheet" href="https://imsun.github.io/gitment/style/default.css">
<script src="https://imsun.github.io/gitment/dist/gitment.browser.js"></script>
<script>
  var gitment = new Gitment({
    //id: '页面 ID', // 可选。默认为 location.href
    owner: 'hellowqw', // 可以是你的GitHub用户名，也可以是github id
    repo: 'hellowqw.github.io',
    oauth: {
      client_id: '50b67e2b9bb3d24c6ad1',
      client_secret: '8158f990db2b870f72de204bf3d9aaf0a41dd35a',
    },
  })
  gitment.render('container')
</script>

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}


{% block script_extra %}
  {% if theme.use_motion %}
    <script type="text/javascript" id="motion.page.archive">
      $('.archive-year').velocity('transition.slideLeftIn');
    </script>
  {% endif %}
{% endblock %}
