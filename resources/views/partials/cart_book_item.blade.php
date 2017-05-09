@foreach($items as $item)
    <div class="row item-book">
        <div class="col-md-2 col-xs-12">
            <img id="image-item" src="images/conan.png" name="item-conan">
        </div>
        <div class="col-md-7 col-xs-12 info-item">
            <table>
                <tr>
                    <a href="#link-to-this-book">
                        <h4>{{$item -> name}}</h4>
                    </a>
                </tr>
                <tr>
                    <td>
                        <label>Tác giả: </label>
                    </td>
                    <td>
                        <label id="auth">{{$item -> author}}</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Số lượng còn lại: </label>
                    </td>
                    <td>
                        <label id="rem">{{$item -> count}}</label>{{--TODO: So Luong con lai?--}}
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Giá: </label>
                    </td>
                    <td>
                        <label id="pr">{{$item -> price}}</label>
                        <label>VND</label>
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-md-3 col-xs-12 other">
            <table>
                <tr>
                    <td>
                        <label>Số lượng: </label>
                    </td>
                    <td>
                        <input id="num" type="number" class="form-control" name="" min="0" value="{{$item -> count}}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <button id="cancel" class="btn btn-danger btn-nhat">Hủy</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
@endforeach
