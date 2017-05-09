$(document).ready(function(){
    $('#search-input').selectize({
       valueField: 'url',
        labelField: 'name',
        searchField: ['name'],
        maxOptions: 10,
        options: [],
        create: false,
        render: {
            option: function(item, escape) {
                console.log('---|RAM|->' + item.name);
                return '<div><img src="'+ root+ '/' + item.icon +'">' +escape(item.name)+'</div>';
            }
        },
        /*optgroups: [
            {value: 'product', label: 'Products'},
            {value: 'category', label: 'Categories'}
        ],
        optgroupField: 'class',
        optgroupOrder: ['product','category'],*/
        load: function(query, callback) {
            if (!query.length) return callback();
            $.ajax({
                url: root+'/api/search/books',
                type: 'GET',
                dataType: 'json',
                data: {
                    keyword: query
                },
                error: function() {
                    callback();
                },
                success: function(res) {
                    callback(res);
                    console.log('RAM->' + JSON.stringify(res));
                }
            });
        },
        onChange: function(){
            window.location = this.items[0];
        }
    });
});