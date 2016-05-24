function ShipmentDecorator () {}


ShipmentDecorator.prototype.bindEvent = function() {
  $('[data-hook=admin_shipment_form] a.deliver').on('click', function () {
    var link = $(this);
    var shipment_number = link.data('shipment-number');
    var url = Spree.url(Spree.routes.shipments_api + '/' + shipment_number + '/ship.json');
    $.ajax({
      type: 'PUT',
      url: url,
      data: {
        token: Spree.api_key
      }
    }).done(function () {
      window.location.reload();
    }).error(function (msg) {
      console.log(msg);
    });
  });
};

$(function() {
  var sD = new ShipmentDecorator();
  sd.bindEvent();
})
