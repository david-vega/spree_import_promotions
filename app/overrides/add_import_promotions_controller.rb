Deface::Override.new(virtual_path: 'spree/admin/promotions/index',
                     name: 'add_import_promotion_button',
                     insert_before: 'li',
                     text: '<li style="margin-right: 5px">
                            <a href="/shop/admin/import_promotions/new" class="button icon-plus" icon="icon-plus">
                            Import Promotions</a></li>'
                    )
