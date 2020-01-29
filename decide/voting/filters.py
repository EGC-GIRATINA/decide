from django.contrib.admin import SimpleListFilter


class StartedFilter(SimpleListFilter):
    title = 'started'
    parameter_name = 'started'

    def lookups(self, request, model_admin):
        return [
            ('NS', 'Not started'),
            ('S', 'Started'),
            ('R', 'Running'),
            ('F', 'Finished'),
        ]

    def queryset(self, request, queryset):
        t = True
        aux = queryset.exclude(start_date__isnull=t).filter(end_date__isnull=t)
        if self.value() == 'NS':
            return queryset.filter(start_date__isnull=True)
        if self.value() == 'S':
            return queryset.exclude(start_date__isnull=True)
        if self.value() == 'R':
            return aux
        if self.value() == 'F':
            return queryset.exclude(end_date__isnull=True)
        else:
            return queryset.all()
